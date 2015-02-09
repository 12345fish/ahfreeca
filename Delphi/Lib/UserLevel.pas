unit UserLevel;

interface

uses
  Classes, SysUtils;

type
  TUserLevel = class
  const
    /// ������
    NORMAL_USER = 0;

    /// ���� Ŭ���̾�Ʈ�� �����ϴ� ������
    ADMIN = 10;

    /// ���� (����)
    ROOM_MASTER = 20;

    /// �������� (���� ���� ����)
    ROOM_ASSISTANCE = 30;
  end;

implementation

end.
