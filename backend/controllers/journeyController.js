const Journey = require("../models/Journey");
const SOS =
    require("../models/SOS");

const startJourney = async (req, res) => {

    try {

        const journey =
            await Journey.create({

                email: req.body.email,

                destination:
                    req.body.destination,

                expectedArrivalTime:
                    req.body.expectedArrivalTime

            });

        res.status(200).json({

            message: "Journey Started",

            journey

        });

    } catch (error) {

        res.status(500).json({

            message: error.message

        });

    }

};

const getJourneyHistory = async (req, res) => {

    try {

        const journeys =
            await Journey.find({

                email: req.body.email

            }).sort({

                createdAt: -1

            });

        res.status(200).json({

            journeys

        });

    } catch (error) {

        res.status(500).json({

            message: error.message

        });

    }

};

const completeJourney = async (req, res) => {

    try {

        await Journey.findByIdAndUpdate(

            req.body.journeyId,

            {
                status: "COMPLETED"
            }

        );

        res.status(200).json({

            message: "Journey Completed"

        });

    } catch (error) {

        res.status(500).json({

            message: error.message

        });

    }

};

const markOverdueJourneys = async (req, res) => {

    try {

        const journeys =
            await Journey.find({

                status: "ACTIVE"

            });

        for (const journey of journeys) {

            const expectedTime =
                journey.expectedArrivalTime;

            const now =
                new Date();

            const currentHour =
                now.getHours();

            const journeyHour =
                parseInt(
                    expectedTime.split(":")[0]
                );

            if (
    currentHour >
    journeyHour
) {

    journey.status =
        "OVERDUE";

    await journey.save();

    await SOS.create({

        email:
            journey.email,

        message:
            "Automatic SOS - Journey Overdue"

    });

}

        }

        res.status(200).json({

            message:
                "Overdue check completed"

        });

    } catch (error) {

        res.status(500).json({

            message:
                error.message

        });

    }

};

module.exports = {
    startJourney,
    getJourneyHistory,
    completeJourney,
    markOverdueJourneys
};