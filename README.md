# HCO Cyberattack Database (2020)
A collection of data regarding health care organization (HCO) cyberattacks that occured in 2020, the peak year of the COVID-19 pandemic.

Created with MySQL Workbench.

## Installation

## Example Queries
### Obtaining all data
SELECT Organization.Name, Organization.OrgType, Breach.BreachType, 
Incident.Victim, Incident.VictimEstimate, Incident.CostEstimate, Incident.Notes, 
Date.IncidentDate, Link.URL, Source.Domain, Date.DateAdded
FROM Incident
INNER JOIN Organization ON Organization.OrgID = FK_OrgID
INNER JOIN Breach ON Breach.BreachID = FK_BreachID
INNER JOIN Date ON Date.DateID = FK_DateID
INNER JOIN Link ON Link.LinkID = FK_LinkID
INNER JOIN Source ON Source.SourceID = FK_SourceID
ORDER BY Organization.Name;

### Adding a new entry

## Other Notes
Column "OrgType" in table "Organization" is currently set up as an enum type, meaning only the following values can be entered:
'Association', 'Consulting', 'Doctor''s Office', 'Government', 'Hospital', 'Information Sharing/Analysis', 'Insurance/Plan Provider', 'Distributor', 'Nursing Home', 'Other', 'Pharma', 'Telehealth', 'University Medical Center', 'Urgent Care'

Column "Victim" in table "Incident" is also set up as an enum with the following values: 'Patients', 'Insiders', 'Both'

## Included Files
