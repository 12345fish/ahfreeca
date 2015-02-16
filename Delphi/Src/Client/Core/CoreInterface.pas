unit CoreInterface;

interface

uses
  Classes, SysUtils, Graphics, ComCtrls;

type
  ITextClient = interface
    ['{AA3E769A-97D8-42C4-B8EF-964D5BE65A65}']

    /// AUserID�� ���� ��Ų��.
    procedure sp_KickOut(AUserID:string);

    /// AUserID�� ��� ��� �Ǵ� ���� �Ѵ�.
    procedure sp_Mute(AUserID:string; AMute:boolean);

    /// ��ȭ �޽����� �����Ѵ�.  �ڽ��� ������ ��ο��� ���޵ȴ�.
    procedure sp_Chat(AFromID,AMsg:string; AColor:TColor);

    {*
      Ư�� ����ڿ��Ը� ��ȭ �޽����� �����Ѵ�.  AUserIDs�� �Ƶ� �����ڷ� ���� ����� �����ϸ� �ȴ�.
      ���̵� ���� �� �� ���� ���ڸ� �̿��ؼ� �����ϸ� �ȴ�.
    }
    procedure sp_Whisper(AFromID,AUserIDs,AMsg:string; AColor:TColor);

    /// ���� ����� ����� �����´�.
    procedure GetUserList(AListView:TListView);

    /// AUserID�� ��� �������� Ȯ���Ѵ�.
    function GetUserMuteStatus(AUserID:string):boolean;

    /// ���� �ڰ��� �ִ� ��?
    function GetIsSender:boolean;
    property IsSender : boolean read GetIsSender;
  end;

  IVoiceClient = interface
    ['{EFF69078-CC22-42B6-8CE6-CA5B3E7A47E3}']

    /// ���� �����͸� �����Ѵ�.
    procedure SendVoice(AData:pointer; ASize:integer);
  end;

implementation

end.
