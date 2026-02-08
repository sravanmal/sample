sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sravan/ust/salesorderui/test/integration/FirstJourney',
		'sravan/ust/salesorderui/test/integration/pages/salesorderList',
		'sravan/ust/salesorderui/test/integration/pages/salesorderObjectPage',
		'sravan/ust/salesorderui/test/integration/pages/SalesOrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, salesorderList, salesorderObjectPage, SalesOrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sravan/ust/salesorderui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThesalesorderList: salesorderList,
					onThesalesorderObjectPage: salesorderObjectPage,
					onTheSalesOrderItemsObjectPage: SalesOrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);