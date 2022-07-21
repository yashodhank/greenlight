import React from 'react';
import useSiteSettings from '../../../hooks/queries/admin/site_settings/useSiteSettings';
import Spinner from '../../shared/stylings/Spinner';
import SiteSettingsRow from './SiteSettingsRow';

export default function Settings() {
  const { isLoading, data: siteSettings } = useSiteSettings();

  if (isLoading) return <Spinner />;

  return (
    <div>
      <SiteSettingsRow
        name="ShareRooms"
        title="Allow Users to Share Rooms"
        description={(
          <p className="text-muted">
            Setting to disbaled will remove the button from the room options <br />
            dropdown, preventing users from sharing rooms
          </p>
      )}
        value={siteSettings.ShareRooms}
      />

      <SiteSettingsRow
        name="PreuploadPresentation"
        title="Allow Users to Preupload Presentations"
        description={(
          <p className="text-muted">
            Users can preupload a presentation to be used as the default <br />
            presentation for that specific room
          </p>
      )}
        value={siteSettings.PreuploadPresentation}
      />
    </div>
  );
}
