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
INSERT INTO Organization(Name,OrgType)
VALUES('Florida Orthopaedic Institute','Association');

INSERT INTO Incident(Victim,VictimEstimate,CostEstimate,FK_OrgID,FK_BreachID)
VALUES('Patients','640,000','$99 million',
(SELECT OrgID FROM Organization WHERE Name = 'Florida Orthopaedic Institute'),
(SELECT BreachID FROM Breach WHERE BreachType = 'Ransomware'));

UPDATE Incident SET Notes = 'SSNs, diagnosis codes, contact info compromised.' WHERE IncidentID = 7;

INSERT INTO Date(IncidentDate,DateAdded)
VALUES("2020-04-09","2021-04-02");
UPDATE Incident SET FK_DateID = ((SELECT DateID FROM Date WHERE DateID = 7)) WHERE IncidentID = 7;

Insert INTO Link(URL)
VALUES('https://www.hipaajournal.com/florida-orthopaedic-institute-facing-class-action-lawsuit-over-ransomware-attack/');
UPDATE Link SET FK_SourceID = ((SELECT SourceID FROM Source WHERE SourceID = 2)) WHERE LinkID = 5;

UPDATE Incident SET FK_LinkID = ((SELECT LinkID FROM Link WHERE LinkID = 5)) WHERE IncidentID = 7;

*Note: new BreachType and Domain columns weren't added in this example because the values are already present in the database. Creating these would result in duplicate values. 

For example, I didn't add the lines below, because I've already entered "Ransomware" and "HIPAAJournal" before from a previous entry. Otherwise, you should write lines similar to the ones below to add a new BreachType or Domain.*

INSERT INTO Breach(BreachType)
VALUES('Ransomware');
INSERT INTO Source(Domain)
VALUES('HIPAAJournal');

## Other Notes
Column "OrgType" in table "Organization" is currently set up as an enum type, meaning only the following values can be entered:
'Association', 'Consulting', 'Doctor''s Office', 'Government', 'Hospital', 'Information Sharing/Analysis', 'Insurance/Plan Provider', 'Distributor', 'Nursing Home', 'Other', 'Pharma', 'Telehealth', 'University Medical Center', 'Urgent Care'

Column "Victim" in table "Incident" is also set up as an enum with the following values: 'Patients', 'Insiders', 'Both'

## Included Files
