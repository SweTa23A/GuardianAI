const express = require("express");

const {
    addEmergencyContact,
    getEmergencyContacts
} = require("../controllers/userController");

const router = express.Router();

router.post("/add-contact", addEmergencyContact);
router.post("/contacts", getEmergencyContacts);

module.exports = router;