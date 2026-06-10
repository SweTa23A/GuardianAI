const express = require("express");

const {
    startJourney,
    getJourneyHistory,
    completeJourney
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

module.exports = router;