const SOS = require("../models/SOS");

const createSOS = async (req, res) => {

    try {

        const sos = await SOS.create({

    email: req.body.email,

    latitude: req.body.latitude,

    longitude: req.body.longitude

});

        res.status(200).json({

            message: "SOS Sent",
            sos

        });

    } catch (error) {

        res.status(500).json({

            message: error.message

        });

    }

};

const getSOSHistory = async (req, res) => {

    try {

        const sosHistory = await SOS.find({

            email: req.body.email

        }).sort({

            createdAt: -1

        });

        res.status(200).json({

            sosHistory

        });

    } catch (error) {

        res.status(500).json({

            message: error.message

        });

    }

};

module.exports = {
    createSOS,
    getSOSHistory
};