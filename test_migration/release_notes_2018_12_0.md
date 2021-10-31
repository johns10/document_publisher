2018-12.0
=========

  

Each new FunnelCloud release contains new feature, improvements and general fixes and enhancements.  Please take a moment to review the items below and let us know if you have any questions or comments.

Features
--------

### Automated End-of-Shift Emailed Department Reports

Our new report mailer feature will now send end of shift department performance reports. Reports will provide a performance snapshot for each department at the end of each shift showing:

*   Top 5 best and worst performing production lines by OEE
*   Top 5 downtime reasons
*   Performance summaries per production line, including good and scrap production counts from host systems (e.g. CMS)

Distribution lists for these reports are defined within department profiles.

### Preventative Maintenance Reports

In this release, we've added reporting features to track progress of preventative maintenance activities and a department-by-department basis.  These reports show the following:

*   Last service date and time
*   Cycles since the last service
*   Duty cycle threshold and indication of whether or not maintenance is required
*   Searching, filtering and viewing of current and historic preventative maintenance

### OEE Tile Dashboard

For locations on the shopfloor where summary information is displayed, we've introduced two new tile-based dashboards.  The OEE tile board displays machine and process based summaries of the utilization, yield efficiency and quality components for groups of machines. The OEE tile board displays up to nine machines per page and will rotate through multiple pages if more machines are configured.

OEE Tile Dashboard URL

https:/**/YourURL**.[app.funnelcloud.io/#/](http://app.funnelcloud.io/#/)**dashboards/oee-tiles**?machineIds=x,x,x,x,x 

### Plan / Actual Tile Dashboard

Similar to the OEE Tile Dashboard, our Plan / Actual Tile Dashboard operates in the same fashion, displaying plan / actual information and supports display of up to 12 tiles per screen.

Plan/Actual Tile Dashboard URL

https:/**/YourURL**.[app.funnelcloud.io/#/dashboards/plan-actual-tiles?machineIds=](http://app.funnelcloud.io/#/)1,2,3,4,5,6

### Shipping Summary Dashboard

The Shipping Summary Dashboard complements our Shipping Dock Dashboard to provide your logistics department visibility against your inbound and outbound shipping schedules and timeliness of arrival of trucks to your facility.

Shipping Summary Dashboard URL

https:/**/YourURL**.[app.funnelcloud.io/#/dashboards/](http://app.funnelcloud.io/#/dashboards/)**shipping-summary**

### Audible Help Request Dashboard

To satisfy the requirements of a few of our customers, we've created a unique dashboard that allows for the configuration of 100% audible alerts.  You can upload audio files of your choosing to FunnelCloud and configure a device to your plant PA system to play the audio files when certain help requests are triggered.  If you're interested in trying out this feature, get in touch with us and we'll provide you with some options for device configuration (RaspberryPis are our current recommended solution due to their cost and ease of setup).

### New OPC Client

FunnelCloud has invested considerable time over the last 6 months to reimagine how we connect and capture data from the shopfloor.  Our new OPC client provides improved reliability for facilities with multiple OPC servers and recovery from network interruptions, as well as laying the groundwork for real-time browsing and interaction with OPC servers directly within FunnelCloud.

Improvements
------------

### General Dashboard Enhancements

To improve visibility and legibility, all dashboards were reviewed for clarity of presentation for this release.  We've increased lettering sizes as well as brightened colors to account for viewing conditions within our customer locations.  In addition, the majority of our boards now display cycle increments in real-time.

### Automated Service Order Creation

To improve use of tablets and reduce input time for maintenance personnel, FunnelCloud now allows for automated opening and closing of service orders for any "Maintenance" type help requests.  The thresholds around automatic closing of service orders can be configured.

### Automated Help Request Triggering

Our notification escalation policies now support automated triggering of Help Requests within FunnelCloud.  You can configure any type of help request to be sent to our dashboards based on observations of a machine going down for a period of time.  Example: if a machine is down for 5 minutes, raise a call for "Leadership".

### Plan / Actual Data on Operator Widget

Based on customer requests, there is now a plan / actual hourly counts to our Operator Widget to give operators visibility into their hour-by-hour production progress.

### User Activity Logs

FunnelCloud has always tracked user activity, but to aid in auditing or troubleshooting issues, we've exposed the audit log to system administrators.

### Service Order Priority

Based on customer requests, there is now a priority field to service orders (High, Normal, or Low) and our maintenance tablet application now sorts service orders according to these priorities.

### Reporting Performance Per Manufacturing Process

Previous to this release, performance reporting per manufacturing process was limited to the duration of a single shift.  There is now added manufacturing process based aggregations to our OEE report.

### Table Sorting / Filtering

We're continuing to add sorting, filtering and paging functionality to all data tables within FunnelCloud.  Our focus has been primarily on those tables related to administration thus far, and further functionality will be added in future releases.

### Database Exporter

Our database export now supports multiple database servers.  In addition to Microsoft SQL Server, we can now export FunnelCloud data to both PostgreSQL as well as MySQL.  We've also extended the data we export to further improve your ability to do ad-hoc reporting in the business intelligence tools of your choosing. Contact us for more information.

Fixes / Enhancements
--------------------

*   Added a new "Logistics" role for users to manage shipping-based functionality
*   Restricted production line timeline reports to only show events longer than 3 minutes in duration
*   Added checks against adding duplicate production parts
*   Addressed an issue where cycles could be missed in the new state monitor for very fast manufacturing processes (< 2sec)
*   Added ability for "tile" based dashboards to rotate through pages of machines
*   Addressed issues where custom dictionary entries were not used consistently across all of FunnelCloud
*   Updated translations
*   Addressed an issue with not being able to remove a notification destination
*   Addressed an issue where, in some cases, downtime reports reflected double-counting of some values
*   Added the ability to clear associations to manufacturing assets and production parts when administering manufacturing processes
*   **All customers will be fully migrated to V2 state monitors as part of this release**

Acknowledgements
----------------

As always, we'd like to offer our continued thanks to our great customers in helping us grow and improve FunnelCloud.

*   Daniel R
*   Michael P
*   Eric B
*   Brad S
*   Sadoc M
*   Dan W
*   Tim R
*   Mary M
*   Carl R
*   Sam B
*   Travis R
*   Wes M
*   Dean P

Attachments:
------------

![](images/icons/bullet_blue.gif) [image.png](attachments/59048042/58753158.png) (image/png)