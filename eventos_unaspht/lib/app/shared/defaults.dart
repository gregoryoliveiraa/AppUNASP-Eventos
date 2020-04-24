
///=======================================
///             ENDPOINTS
///=======================================

const FACEBOOK_PAGE_URL = "https://www.facebook.com/";
const INSTAGRAM_PAGE_URL = "https://www.instagram.com/";

///=======================================
///                IMAGES
///=======================================

final String kAppIcon = "assets/appIconImageWhite.png";
final String kHackRURed = "assets/hackru_red.png";
final String kHackRUYellow = "assets/hackru_yellow.png";
final String kHackRUGreen = "assets/hackru_green.png";
final String kHackRUBlue = "assets/hackru_blue.png";
final String kHackRUOffWhite = "assets/hackru_offwhite.png";
final String kHackRUWhite = "assets/hackru_white.png";
final String kHackRUBlack = "assets/hackru_black.png";
final String kHackRUAllColor = "assets/hackru_tri_color.png";
final String kDrawerBg = "assets/drawer_bg.png";
final String kHackRUBanner = "assets/hackru_banner.png";
final String kSplashScreen = "assets/splashScreen.png";


///=======================================
///               STRINGS
///=======================================

const String kAppTitle = "HackRU";
const String kSeasonTitle = "Fall 2020";
const kAboutHackRU = 'HackRU is a 24-hour hackathon at Rutgers University. '
                    'We welcome hundreds of students to join us in building awesome tech projects. '
                    'Industry experts and mentors help foster an atmosphere of learning through tech-talks and one-on-one guidance. '
                    'We encourage all students, no matter their experience level or educational background, '
                    'to challenge themselves and expand their creative, technical, and collaboration skills at HackRU.' ;
const sobreApp = 'O aplicatico de Eventos do Unasp é destinado aos estudantes do campus Hortolândia. '
                ' As chamadas são realixadas através de QR code para checagem de presença...' ;
const kSlogan = "Hack All Knight";

///=======================================
///           API CALLS SCHEMA
///=======================================

/**
 * Default login url
 * @params
 * {
 *     "headers": {
 *         "Content-Type": "application/json"
 *     },
 *     "body": {
 *         "email": "<EMAIL>",
 *         "password": "<PASSWORD>"
 *     }
 * }
 * @returns
 * {
 *     "statusCode": 200,
 *     "isBase64Encoded": false,
 *     "headers": {
 *         "Content-Type": "application/json",
 *         "Access-Control-Allow-Origin": [
 *             "*"
 *         ],
 *         "Access-Control-Allow-Headers": [
 *             "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token"
 *         ],
 *         "Access-Control-Allow-Credentials": [
 *             true
 *         ]
 *     },
 *     "body": "{\"auth\": {\"token\": \"a6390c07-3bef-4062-ae69-3a0e983af124\", \"valid_until\": \"2018-12-29T18:41:17.225329\", \"email\": \"TESTING123\"}}"
 * }
 */

/// Note: BASE = DEV_URL OR PROD_URL

/// Login
//  BASE + "/authorize"

/// Default SignUp url, expects
//  BASE + "/create"

/// Default user url, expects
//  BASE + "/read"

/// Default user update information, expects
//  BASE + "/update"

/// Day of event schedule
//  BASE + "/dayof-events"

/// Day of slack announcements
//  BASE + "/dayof-slack"

/// Get QR codes
//  BASE + "/qr",       for given email address get generated qr code
//  BASE + "/resume",   for scanned qr code get hacker's resume
