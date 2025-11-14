trigger connectedAppRequest on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        for(Account acc: Trigger.new){
            salesforceRequest.accountCreate(acc.Name, acc.Type, acc.Rating, acc.Phone);
        }
    }
}
