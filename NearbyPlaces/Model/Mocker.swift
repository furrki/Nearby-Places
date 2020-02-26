//
//  Mocker.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Mocker {
    static func getPlaces() -> [Place] {
        return [
            Place(JSON(parseJSON: """
               {
                  "name" : "Tsvetkova Bebov Komarevski, Attorneys-at-Law",
                  "rating" : 5,
                  "types" : [
                    "lawyer",
                    "point_of_interest",
                    "establishment"
                  ],
                  "photos" : [
                    {
                      "html_attributions" : [
                        "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/108875777369837447560\">Адвокатско дружество Цветкова, Бебов, Комаревски<\\/a>"
                      ],
                      "width" : 1200,
                      "photo_reference" : "CmRaAAAAyGCniR5OWmQMBRWhz4D52Rpj_dtunei-eC_epG7LTRheSSXSYh9MJeL8gBKYJkFOWIynChZ8Nn3LRIN8bEELrHpGamSjTB6-GHvGiIWxQluEhbnBu2U9tZl3L2QSFCxREhCNpE7qxiX4C7BxA2Mh-kbjGhRL0nGctSivSmrm_Bti2dB7M5J4hg",
                      "height" : 296
                    }
                  ],
                  "geometry" : {
                    "location" : {
                      "lat" : 42.698284899999997,
                      "lng" : 23.321657200000001
                    },
                    "viewport" : {
                      "northeast" : {
                        "lng" : 23.3231164802915,
                        "lat" : 42.6996137802915
                      },
                      "southwest" : {
                        "lat" : 42.696915819708501,
                        "lng" : 23.3204185197085
                      }
                    }
                  },
                  "place_id" : "ChIJcTRCKm-FqkARKQPmtw8KdWQ",
                  "scope" : "GOOGLE",
                  "user_ratings_total" : 1,
                  "plus_code" : {
                    "global_code" : "8GJ5M8XC+8M",
                    "compound_code" : "M8XC+8M Sofia, Bulgaria"
                  },
                  "opening_hours" : {
                    "open_now" : false
                  },
                  "vicinity" : "bulevard \"Knyaginya Maria Luiza\" 9-11, fl. 4, Sofia",
                  "icon" : "https:\\/\\/maps.gstatic.com\\/mapfiles\\/place_api\\/icons\\/generic_business-71.png",
                  "id" : "048d30073229577bdd444a09a5a9d20d1721dc19",
                  "reference" : "ChIJcTRCKm-FqkARKQPmtw8KdWQ"
                }, {
                  "name" : "VIVACOM",
                  "rating" : 3.3999999999999999,
                  "types" : [
                    "point_of_interest",
                    "establishment"
                  ],
                  "photos" : [
                    {
                      "height" : 2991,
                      "photo_reference" : "CmRaAAAA3cwqjMFt7TqO8U4XVr0HUGO7Q9xr4v4upScDApt2yoT-x6ux0Sl6Unc-sEEl5pj9RDh6G-yXxeCwkumZl7L5R3vJeix1nU_BZ2zwBi2s-sUIItIiYDcO20B-IYjPunZ3EhDVF8-S2_zyGAnbLGUsRp0IGhTfql0zYeuHxiAF7P3E-c5Hm_gcog",
                      "html_attributions" : [
                        "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/111534044068831346683\">Виваком<\\/a>"
                      ],
                      "width" : 4487
                    }
                  ],
                  "geometry" : {
                    "location" : {
                      "lat" : 42.697857999999997,
                      "lng" : 23.321144999999991
                    },
                    "viewport" : {
                      "southwest" : {
                        "lng" : 23.319790919708499,
                        "lat" : 42.696497619708502
                      },
                      "northeast" : {
                        "lat" : 42.699195580291502,
                        "lng" : 23.322488880291498
                      }
                    }
                  }
        """))
        ]
    }
    
    static func getPlaceDetail() -> PlaceDetail {
        return PlaceDetail(JSON(parseJSON: """
            {
              "geometry" : {
                "viewport" : {
                  "southwest" : {
                    "lat" : 42.696915819708501,
                    "lng" : 23.3204185197085
                  },
                  "northeast" : {
                    "lat" : 42.6996137802915,
                    "lng" : 23.3231164802915
                  }
                },
                "location" : {
                  "lat" : 42.698284899999997,
                  "lng" : 23.321657200000001
                }
              },
              "photos" : [
                {
                  "width" : 4608,
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/104949121987198987785\">Vladimir Iliev<\\/a>"
                  ],
                  "height" : 2592,
                  "photo_reference" : "CmRaAAAA2G6rMDroSZCArLsm377Jzeuxx24aUIvDioGpR0TJxa8LiIOe0ewGmUmGrY2umzlAM-W4gAolmkQR2rCmJq5dO2_Oro03b0_SbCdg5AViyuo_dU2yhnijbJMZmo6kZoJNEhBKk_ti1blCJGAIljomdT9yGhRLohGQ4mVpD5WfjNIVFgGOJ0iz5g"
                },
                {
                  "width" : 4160,
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/109484851256390164092\">Pet Pan<\\/a>"
                  ],
                  "height" : 3120,
                  "photo_reference" : "CmRaAAAAvxaPuSgSu0XL5JfIIA7QE2vxd1FhPZa8vL1hJERV0iixiFoUifkAmyKx2PYnKs4EjyRe456VhTPdvEfqa23-BLmw1RtGa9DtUIQKRjVIqHCQXI30i4WP4faYkkbPeTRWEhCRZEFLd6fkOo3b5zE26WXlGhQuTQbIc0iZ6C7hA7Ar41SMeIktJQ"
                },
                {
                  "photo_reference" : "CmRaAAAAIjeAmCqpd68mwAG61l5Vx_gpGHJs9VvSMXf-3hYFyQJy4pRBMLzY5Xrxd1oTHK0Csj4mk3X-oJMEd1NbZw_btNEvcRfaBQjTIfmdCrp3wyGJ8fdNxWvynf1ZSEX60Wh7EhBTbhIMuEiftAmvNqSSyiC9GhS_DM5O61BQS-G5VHV3-32IzNc4rA",
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/104949121987198987785\">Vladimir Iliev<\\/a>"
                  ],
                  "width" : 4608,
                  "height" : 2592
                },
                {
                  "photo_reference" : "CmRZAAAA7iWANwHt8vtw5W04afasnLfBej76LSOrlLUX_GCE_jVgWTiaJKPHtsfJbqH1FFX9u4FB4FlvaDMbYj3alWsaW1zMqiRz7DiBQ44yfHQIQ0rA18vbdHboazY0AQH1CY1aEhCsdPTI56q6i3wu0N1b0qqdGhTG1RnUrQ81ON8XnPCY19fqVf48Rg",
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/107560577860502554855\">Димитър Дедов<\\/a>"
                  ],
                  "width" : 3000,
                  "height" : 4000
                },
                {
                  "photo_reference" : "CmRaAAAAjkf5YOPPb-sWWf30Gs6iMNLlzjQKeBEbDPts3KLYxYE50oFGNCPXcHqRkjKiaSZl0ITeaxRge4PEIH27V5ItlRC0nwTDfVX1WcsgXvrGB-d0khBfWUgRlWF9UrYIP8djEhD7ObUNFanT0hwjSXypuz8rGhTZXfwte3Lgq4DaikH7zvZWwO66YQ",
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/111547947951583327162\">Velizar Komitski<\\/a>"
                  ],
                  "width" : 3968,
                  "height" : 2240
                },
                {
                  "photo_reference" : "CmRaAAAA1p_kU3cN9eGgB34Ng11f-ctB_G4_zhmXgZj-7xIX33buGhcDHZUXK8nVyHJk0pVJh4r04CaACITWuyYEnG-wfVbNjOiAukgWc6wxwkfDvPLqdwnqvwGTXibDv_VhsK1HEhAoDBycCJi2E-Y47q7WdWB0GhR1q8qVLWOd3rGW_FYmA4jE8FO_mA",
                  "html_attributions" : [
                    "<a href=\"https:\\/\\/maps.google.com\\/maps\\/contrib\\/103583106412771225001\">Ron van Bruchem<\\/a>"
                  ],
                  "width" : 3456,
                  "height" : 4608
                }
              ],
              "formatted_address" : "bulevard \"Knyaginya Maria Luiza\" 9-11, 1000 Old City Center, Sofia, Bulgaria",
              "opening_hours" : {
                "weekday_text" : [
                  "Monday: Open 24 hours",
                  "Tuesday: Open 24 hours",
                  "Wednesday: Open 24 hours",
                  "Thursday: Open 24 hours",
                  "Friday: Open 24 hours",
                  "Saturday: Closed",
                  "Sunday: Closed"
                ],
                "open_now" : true,
                "periods" : [
                  {
                    "close" : {
                      "time" : "0000",
                      "day" : 6
                    },
                    "open" : {
                      "time" : "0000",
                      "day" : 1
                    }
                  }
                ]
              },
              "rating" : 4.5,
              "name" : "Прайсуотърхаускупърс България"
            }
            """))
    }
}
