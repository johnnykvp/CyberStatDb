# HCO Cyberattack Database (2020)
A collection of data regarding health care organization (HCO) cyberattacks that occured in 2020, the peak year of the COVID-19 pandemic.

Created with MySQL Workbench.

## Example Queries
### Obtaining all data
SELECT Organization.Name, Organization.OrgType, Breach.BreachType, 
Incident.Victim, Incident.VictimEstimate, Incident.CostEstimate, Incident.Notes, 
Date.IncidentDate, Source.Link, Source.Domain, Date.DateAdded,
FROM Incident
INNER JOIN Organization ON Organization.OrgID = FK_OrgID
INNER JOIN Breach ON Breach.BreachID = FK_BreachID
INNER JOIN Date ON Date.DateID = FK_DateID
INNER JOIN Source ON Source.SourceID = FK_SourceID
ORDER BY Organization.Name;

### Adding a new entry

## Other Notes

## Included Files
