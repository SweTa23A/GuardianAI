const mongoose = require("mongoose");

const sosSchema = new mongoose.Schema({

    email: {
        type: String,
        required: true
    },

    message: {
        type: String,
        default: "Emergency Alert Activated"
    },

    latitude: {
        type: Number
    },

    longitude: {
        type: Number
    },

    createdAt: {
        type: Date,
        default: Date.now
    }

});

module.exports = mongoose.model(
    "SOS",
    sosSchema
);