namespace committeeManagement;

entity Committee {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  startDate: Date;
  endDate: Date;
  status: String(20);
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
  status: String(20);
  committee: Association to Committee;
  members: Association to many Member on members.meeting = $self;
}

entity User {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  role: String(50);
  authenticatedAccess: Boolean;
}

