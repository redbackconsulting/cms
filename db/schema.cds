using { sap.common.CodeList } from '@sap/cds/common';


namespace committeeManagement;

entity Committee {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  startDate: Date;
  endDate: Date;
  stat: Association to Status;
//  members: Association to many Member on members.committee = $self;
  members: Association to many CommitteeMembers on members.committee = $self;
  meetings: Association to many Meeting on meetings.committee = $self;
}

entity Member {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  role: String(50);
  rate : Decimal(10,2);
  committee: Association to Committee;
  meeting: Association to Meeting;
  user: Association to User;
}

entity CommitteeMembers {
    key committee : Association to Committee;
    key member : Association to Member;
    role : String(50);
}

entity MeetingMembers {
    key meeting : Association to Meeting;
    key member : Association to Member;
    role : String(50);
    timeSpent : Decimal(10,2);
    cost : Decimal(10,2);  // calculated as this.member.rate * this.timeSpent;
}

entity Meeting {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  startDate: Date;
  endDate: Date;
  status: Association to Status;
  committee: Association to Committee;
//  members: Association to many Member on members.meeting = $self;
  members: Association to many MeetingMembers on members.meeting = $self;
}

entity User {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  role: String(50);
  authenticatedAccess: Boolean;
}

/*
entity Status : CodeList {
  key code : String enum {
        new = 'N';
        in_process = 'I'; 
        on_hold = 'H'; 
        approved = 'A'; 
        rejected = 'R';
        closed = 'C'; 
  }
}
*/
entity Status : CodeList {
  key code : String(1);
}