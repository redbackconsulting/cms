using { committeeManagement } from '../db/schema.cds';

@path: '/service/committeeManagement'
@requires: 'authenticated-user'
service committeeManagementSrv 
{
  @odata.draft.enabled
  entity Committee as projection on committeeManagement.Committee;
  @odata.draft.enabled
  entity Member as projection on committeeManagement.Member;
  @odata.draft.enabled
  entity Meeting as projection on committeeManagement.Meeting;
  @odata.draft.enabled
  entity User as projection on committeeManagement.User;
  entity Status as projection on committeeManagement.Status;
}