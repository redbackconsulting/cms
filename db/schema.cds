using { sap.common.CodeList } from '@sap/cds/common';


namespace committeeManagement;

entity Committee {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  startDate: Date;
  endDate: Date;
  status: Association to Status;
  members: Association to many Member on members.committee = $self;
  meetings: Association to many Meeting on meetings.committee = $self;
}

entity Member {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  role: String(50);
  committee: Association to Committee;
  meeting: Association to Meeting;
}

entity Meeting {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  startDate: Date;
  endDate: Date;
  status: Association to Status;
  committee: Association to Committee;
  members: Association to many Member on members.meeting = $self;
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
  key code : String enum {
        new = 'N';
        in_process = 'I'; 
        on_hold = 'H'; 
        approved = 'A'; 
        rejected = 'R';
        closed = 'C'; 
  }
}