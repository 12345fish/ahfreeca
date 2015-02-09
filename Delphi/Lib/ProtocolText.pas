unit ProtocolText;

interface

uses
  Classes, SysUtils;

type
  TPacketType = (
    // ����� ���� �� ����
    ptLogin, ptLogout,
    ptAskUserList,
    ptErVersion, ptOkLogin, ptErLogin, ptIDinUse,
    ptUserIn, ptUserOut, ptUserList,

    // ����
    ptChat, ptWhisper,

    // ������ ���
    ptCallSender,

    // ���� ���
    ptKickOut, ptUserLevel, ptMute, ptNotice, ptCloseRoom, ptOpenModule,

    // ��Ÿ
    ptOnAir, ptOffAir,
    ptSetUserModeToSender,

    // ����ڵ��� ���� ���¸� �����Ѵ�.
    ptUserStatus
  );

implementation

end.
