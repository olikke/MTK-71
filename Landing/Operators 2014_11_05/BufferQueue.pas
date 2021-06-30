unit BufferQueue;

interface

uses Windows;

type
    PBufferQueueItem = ^TBufferQueueItem;
    TBufferQueueItem = packed record  // ������� �������
        Buffer  :string;
        Next    :PBufferQueueItem;
    end;

    TBufferQueue = class           // ������� �������
    private
        pStart      :PBufferQueueItem;     // ������ ������� �������
        pLast       :PBufferQueueItem;     // ��������� ������� �������
        lCount      :Integer;              // ����� �������
        cs          :RTL_CRITICAL_SECTION; // critical section, ��� ������� ������������� ��� ���� �������
    public
        constructor Create();
        destructor  Destroy(); override;
        function    Empty():boolean;               // ��������: ������� ������ ��� ���
        function    Full():boolean;                // ��������: ������� ��������� ��� ���
        function    Enqueue(Data:string):boolean;  // ������� �������� ������� � ����� �������
        function    Get(var Data:string):boolean;  // ������� ������� ������� �� ������ �������
    end;

const
    MAX_BUFFER_QUEUE_LENGTH = 8;      // ������������ ����� �������
    PACKET_SLICE_BODY_SIZE  = 1476;   // ������������ ��� UDP ������ ���� ����� ������

var SendQueue:TBufferQueue=nil;

implementation

constructor TBufferQueue.Create;
begin
    inherited;
    pStart := nil;
    pLast  := nil;
    lCount := 0;
    InitializeCriticalSection(cs);
end;

destructor TBufferQueue.Destroy;
var p:PBufferQueueItem;
begin
    //�������������� ������� ��������
    EnterCriticalSection(cs);
    while pStart<>nil do begin
        p := pStart;
        pStart := pStart^.Next;
        p^.Buffer := '';
        dispose(p);
    end;
    lCount := 0;
    pLast := nil;
    LeaveCriticalSection(cs);
    DeleteCriticalSection(cs);
    inherited;
end;

function TBufferQueue.Empty: boolean;
// ���� ������� ������, �� ���������� true
begin
    EnterCriticalSection(cs);
    result := lCount=0;
    LeaveCriticalSection(cs);
end;

function TBufferQueue.Full: boolean;
// ���� ������� ���������, �� ���������� false
begin
    EnterCriticalSection(cs);
    result := lCount>=MAX_BUFFER_QUEUE_LENGTH;
    LeaveCriticalSection(cs);
end;

function TBufferQueue.Enqueue(Data: string): boolean;
// ���� � ������� ��� �����, �� ���������� false
// ����� ��������� ������ � ����� � ���������� true
var p:PBufferQueueItem;
begin
    EnterCriticalSection(cs);
    //���� � ������� ���� �����
    result := lCount<MAX_BUFFER_QUEUE_LENGTH;
    if result then begin
        new(p);
        p^.Next := nil;
        // ����� ������ �����������, ��� ���������� ������, ��� �� �������� ������ ���
        p^.Buffer := Copy(Data, 1, $7FFFFFFF);
        if pLast=nil then begin
            pLast := p;
            pStart := p;
        end else begin
            pLast^.Next := p;
            pLast := p;
        end;
        inc(lCount);
    end;
    LeaveCriticalSection(cs);
end;

function TBufferQueue.Get(var Data: string): boolean;
// ���� � ������� ���� ������, �� ��������� �� � ���������� true
// ����� ���������� false
var p:PBufferQueueItem;
begin
    EnterCriticalSection(cs);
    p := pStart;
    result := p<>nil;
    if result then begin
        dec(lCount);
        if pLast=pStart then pLast := nil;
        pStart := pStart^.Next;
        Data := p^.Buffer; // ����� ���������� �� �����, ���
        p^.Buffer := '';   //  ��� ����� �� �� ������� ������ ������
        dispose(p);
    end else begin
        Data := '';
    end;
    LeaveCriticalSection(cs);
end;

end.
