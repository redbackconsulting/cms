using { committeeManagementSrv } from '../srv/service.cds';

annotate committeeManagementSrv.Committee with @UI.HeaderInfo: { TypeName: 'Committee', TypeNamePlural: 'Committees', Title: { Value: name } };
annotate committeeManagementSrv.Committee with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate committeeManagementSrv.Committee with @UI.Identification: [{ Value: name }];
annotate committeeManagementSrv.Committee with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate committeeManagementSrv.Committee with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate committeeManagementSrv.Committee with {
  description @title: 'Description';
  startDate @title: 'Start Date';
  endDate @title: 'End Date';
  status @title: 'Status'
};

annotate committeeManagementSrv.Committee with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status }
];

annotate committeeManagementSrv.Committee with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status }
  ]
};

annotate committeeManagementSrv.Committee with {
  members @Common.Label: 'Members';
  meetings @Common.Label: 'Meetings'
};

annotate committeeManagementSrv.Committee with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate committeeManagementSrv.Committee with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate committeeManagementSrv.Committee with @UI.SelectionFields: [
  name
];

annotate committeeManagementSrv.Member with @UI.HeaderInfo: { TypeName: 'Member', TypeNamePlural: 'Members', Title: { Value: name } };
annotate committeeManagementSrv.Member with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate committeeManagementSrv.Member with @UI.Identification: [{ Value: name }];
annotate committeeManagementSrv.Member with {
  committee @Common.ValueList: {
    CollectionPath: 'Committee',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: committee_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate committeeManagementSrv.Member with {
  meeting @Common.ValueList: {
    CollectionPath: 'Meeting',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: meeting_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate committeeManagementSrv.Member with @UI.DataPoint #role: {
  Value: role,
  Title: 'Role',
};
annotate committeeManagementSrv.Member with {
  role @title: 'Role'
};

annotate committeeManagementSrv.Member with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Label: 'Committee', Value: committee_ID },
    { $Type: 'UI.DataField', Label: 'Meeting', Value: meeting_ID }
];

annotate committeeManagementSrv.Member with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Label: 'Committee', Value: committee_ID },
    { $Type: 'UI.DataField', Label: 'Meeting', Value: meeting_ID }
  ]
};

annotate committeeManagementSrv.Member with {
  committee @Common.Text: { $value: committee.name, ![@UI.TextArrangement]: #TextOnly };
  meeting @Common.Text: { $value: meeting.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate committeeManagementSrv.Member with {
  committee @Common.Label: 'Committee';
  meeting @Common.Label: 'Meeting'
};

annotate committeeManagementSrv.Member with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#role' }
];

annotate committeeManagementSrv.Member with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate committeeManagementSrv.Member with @UI.SelectionFields: [
  committee_ID,
  meeting_ID
];

annotate committeeManagementSrv.Meeting with @UI.HeaderInfo: { TypeName: 'Meeting', TypeNamePlural: 'Meetings', Title: { Value: name } };
annotate committeeManagementSrv.Meeting with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate committeeManagementSrv.Meeting with @UI.Identification: [{ Value: name }];
annotate committeeManagementSrv.Meeting with {
  committee @Common.ValueList: {
    CollectionPath: 'Committee',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: committee_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate committeeManagementSrv.Meeting with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate committeeManagementSrv.Meeting with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate committeeManagementSrv.Meeting with {
  startDate @title: 'Start Date';
  endDate @title: 'End Date';
  status @title: 'Status'
};

annotate committeeManagementSrv.Meeting with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Committee', Value: committee_ID }
];

annotate committeeManagementSrv.Meeting with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Committee', Value: committee_ID }
  ]
};

annotate committeeManagementSrv.Meeting with {
  committee @Common.Text: { $value: committee.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate committeeManagementSrv.Meeting with {
  committee @Common.Label: 'Committee';
  members @Common.Label: 'Members'
};

annotate committeeManagementSrv.Meeting with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate committeeManagementSrv.Meeting with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate committeeManagementSrv.Meeting with @UI.SelectionFields: [
  committee_ID
];

annotate committeeManagementSrv.User with @UI.HeaderInfo: { TypeName: 'User', TypeNamePlural: 'Users', Title: { Value: name } };
annotate committeeManagementSrv.User with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate committeeManagementSrv.User with @UI.Identification: [{ Value: name }];
annotate committeeManagementSrv.User with @UI.DataPoint #role: {
  Value: role,
  Title: 'Role',
};
annotate committeeManagementSrv.User with @UI.DataPoint #authenticatedAccess: {
  Value: authenticatedAccess,
  Title: 'Authenticated Access',
};
annotate committeeManagementSrv.User with {
  role @title: 'Role';
  authenticatedAccess @title: 'Authenticated Access'
};

annotate committeeManagementSrv.User with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Value: authenticatedAccess }
];

annotate committeeManagementSrv.User with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: role },
    { $Type: 'UI.DataField', Value: authenticatedAccess }
  ]
};

annotate committeeManagementSrv.User with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#role' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#authenticatedAccess' }
];

annotate committeeManagementSrv.User with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate committeeManagementSrv.User with @UI.SelectionFields: [
  name
];

