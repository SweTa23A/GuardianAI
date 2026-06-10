const express = require("express");

const {
    createSOS,
    getSOSHistory
} = require("../controllers/sosController");

const router = express.Router();

router.post(
    "/send",
    createSOS
);

router.post(
    "/history",
    getSOSHistory
);

module.exports = router;