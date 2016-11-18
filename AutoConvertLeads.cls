// Implemented in production

public class AutoConvertLeads
    {
        @InvocableMethod
        public static void LeadAssign(List<Id> LeadIds)
        {
            LeadStatus CLeadStatus = [SELECT Id, MasterLabel
                                      FROM LeadStatus
                                      WHERE IsConverted = true
                                      LIMIT 1];
            List<Database.LeadConvert> MassLeadconvert = new List<Database.LeadConvert>();
            for(id currentLead: LeadIds){
                Database.LeadConvert Leadconvert = new Database.LeadConvert();

            Leadconvert.setLeadId(currentLead);

            Leadconvert.setConvertedStatus(CLeadStatus.MasterLabel);
                MassLeadconvert.add(Leadconvert);
            }

            if (!MassLeadconvert.isEmpty()) {
              List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadconvert);
            }
        }
    }
