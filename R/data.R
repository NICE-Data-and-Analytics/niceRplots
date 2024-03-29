#' Anticoagulant medicine dispensing data
#'
#' Data showing the monthly primary care dispensing of 5 anticoagulant medicines: apixaban,
#' dabigatran etexilate, rivaroxaban, edoxaban, and warfarin sodium. Data is
#' shown as monthly usage for all 106 sub-ICB locations in England between
#' October 2017 and September 2022.
#'
#' @format A data frame with 31,792 rows and 10 columns:
#' \describe{
#'   \item{date}{the month the data covers, displayed as first day of the month}
#'   \item{chemical}{Anticoagulant medicine}
#'   \item{bnf_code}{Medicine British National Formulary code}
#'   \item{ods_code}{Sub-ICB location Organisation Data Service code}
#'   \item{gss_code}{Sub-ICB location Government Statistical Service code}
#'   \item{name}{Sub-ICB location name}
#'   \item{items}{Number of items prescribed}
#'   \item{quantity}{Number of individual units prescribed e.g. tablets, capsules}
#'   \item{actual_cost}{Cost of medicine after discounts have been applied}
#'   \item{total_list_size}{Number of people registered at GP in Sub-ICB location}
#' }
#' @source
#' <https://openprescribing.net/>
#' <https://geoportal.statistics.gov.uk/search?collection=Dataset&sort=-created&tags=all(NAC_LOC)>
"anticoag_df"


#' Polygons for sub-ICB locations
#'
#' Data frame containing the April 2022 polygon boundaries for all 106 sub-ICB locations
#' in England. Data taken directly from the Open Geography Portal as a .geoJSON file.
#'
#' @format A data frame with 106 rows and 9 columns:
#' \describe{
#'   \item{sicbl22cd}{Sub-ICB location Government Statistical Service code}
#'   \item{sicbl22nm}{Sub-ICB location name}
#'   \item{bng_e}{Eastings}
#'   \item{bng_n}{Northings}
#'   \item{long}{Longtitude}
#'   \item{lat}{Latitude}
#'   \item{shape_length}{Shape length in meters}
#'   \item{shape_area}{Shape area in square meters}
#'   \item{geometry}{Polygon shape}
#' }
#' @source
#' <https://geoportal.statistics.gov.uk/datasets/ons::sub-integrated-care-board-locations-july-2022-en-buc/explore?location=52.809615%2C-2.452657%2C8.22>
"sub_icb_shapes_2022"


#' Polygon for England
#'
#' Single polygon containing the boundary for England, created by merging the polygons
#' for all sub-ICB locations.
#'
#' @format A single SFC_multipolygon shape
#' @source
#' <https://geoportal.statistics.gov.uk>
"england_shape_2022"


#' NICE brand colours
#'
#' A named vector of NICE brand colours for use in plots
#'
#' @format A named vector with 33 brand colours and associated HEX codes
#' @source
#' <https://indepth.nice.org.uk/our-brand/index.html>
"nice_colours"


#' Government Analysis Function colours
#'
#' A named vector of Government Analysis Function (GAF) colours for use in plots
#'
#' @format A named vector with 9 colours and associated HEX codes
#' @source
#' <https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/>
"gaf_colours"
