const express = require("express");

const {
    startJourney,
    getJourneyHistory,
    completeJourney,
    markOverdueJourneys
} = require(
    "../controllers/journeyController"
);

const router =
    express.Router();

router.post(
    "/start",
    startJourney
);

router.post(
    "/history",
    getJourneyHistory
);

router.post(
    "/complete",
    completeJourney
);

router.post(
    "/check-overdue",
    markOverdueJourneys
);

module.exports = router;