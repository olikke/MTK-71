unit BufferQueue;

interface

uses Windows;

type
    PBufferQueueItem = ^TBufferQueueItem;
    TBufferQueueItem = packed record  // элемент очереди
        Buffer  :string;
        Next    :PBufferQueueItem;
    end;

    TBufferQueue = class           // очередь буферов
    private
        pStart      :PBufferQueueItem;     // первый элемент очереди
        pLast       :PBufferQueueItem;     // последний элемент очереди
        lCount      :Integer;              // длина очереди
        cs          :RTL_CRITICAL_SECTION; // critical section, ибо очередь предназначена для двух потоков
    public
        constructor Create();
        destructor  Destroy(); override;
        function    Empty():boolean;               // проверка: очередь пустая или нет
        function    Full():boolean;                // проверка: очередь заполнена или нет
        function    Enqueue(Data:string):boolean;  // попытка добавить элемент в конец очереди
        function    Get(var Data:string):boolean;  // попытка считать элемент из начала очереди
    end;

const
    MAX_BUFFER_QUEUE_LENGTH = 8;      // максимальная длина очереди
    PACKET_SLICE_BODY_SIZE  = 1476;   // максимальный для UDP размер тела куска пакета

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
    //принудительная очистка остатков
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
// если очередь пустая, то возвращает true
begin
    EnterCriticalSection(cs);
    result := lCount=0;
    LeaveCriticalSection(cs);
end;

function TBufferQueue.Full: boolean;
// если очередь заполнена, то возвращает false
begin
    EnterCriticalSection(cs);
    result := lCount>=MAX_BUFFER_QUEUE_LENGTH;
    LeaveCriticalSection(cs);
end;

function TBufferQueue.Enqueue(Data: string): boolean;
// если в очереди нет места, то возвращает false
// иначе добавляет данные в конец и возвращает true
var p:PBufferQueueItem;
begin
    EnterCriticalSection(cs);
    //если в очереди есть место
    result := lCount<MAX_BUFFER_QUEUE_LENGTH;
    if result then begin
        new(p);
        p^.Next := nil;
        // нужно именно скопировать, ибо компилятор хитрый, сам не копирует просто так
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
// если в очереди есть данные, то считывает их и возвращает true
// иначе возвращает false
var p:PBufferQueueItem;
begin
    EnterCriticalSection(cs);
    p := pStart;
    result := p<>nil;
    if result then begin
        dec(lCount);
        if pLast=pStart then pLast := nil;
        pStart := pStart^.Next;
        Data := p^.Buffer; // здесь копировать не нужно, ибо
        p^.Buffer := '';   //  вот здесь же мы убиваем старую ссылку
        dispose(p);
    end else begin
        Data := '';
    end;
    LeaveCriticalSection(cs);
end;

end.
