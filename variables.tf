variable "cognito_user_pool_name" {
    type = string
}
variable "cognito_domain_name" {
    type = string
}
variable "cognito_client_name" {
    type = string
}
variable "google_client_id" {
    type = string
}
variable "google_client_secret" {
    type = string
}
variable "callback_urls" {
    type = list(string)
}
variable "logout_urls" {
    type = list(string)
}
