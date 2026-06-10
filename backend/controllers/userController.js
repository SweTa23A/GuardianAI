const User = require("../models/User");

const addEmergencyContact = async (req, res) => {

    try {

        const { email, name, phone } = req.body;

        const user = await User.findOne({ email });

        if (!user) {
            return res.status(404).json({
                message: "User not found"
            });
        }

        user.emergencyContacts.push({
            name,
            phone
        });

        await user.save();

        res.status(200).json({
            message: "Emergency contact added successfully",
            emergencyContacts: user.emergencyContacts
        });

    } catch (error) {

        res.status(500).json({
            message: error.message
        });

    }
};

const getEmergencyContacts = async (req, res) => {

    try {

        const { email } = req.body;

        const user = await User.findOne({ email });

        if (!user) {
            return res.status(404).json({
                message: "User not found"
            });
        }

        res.status(200).json({
            emergencyContacts: user.emergencyContacts
        });

    } catch (error) {

        res.status(500).json({
            message: error.message
        });

    }
};

module.exports = {
    addEmergencyContact,
    getEmergencyContacts
};