const mongoose = require("mongoose");

const journeySchema = new mongoose.Schema({

    email: {
        type: String,
        required: true
    },

    destination: {
        type: String,
        required: true
    },

    expectedArrivalTime: {
        type: String,
        required: true
    },

    status: {
        type: String,
        default: "ACTIVE"
    },

    createdAt: {
        type: Date,
        default: Date.now
    }

});

module.exports = mongoose.model(
    "Journey",
    journeySchema
);