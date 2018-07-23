trigger OppUpdateTest on Opportunity (before update) {
for(Opportunity opp: trigger.new){
    opp.Description = 'changeWon';
  upsert opp;
    }
}