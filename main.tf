resource "aws_cognito_user_pool" "pool" {
  name = var.cognito_user_pool_name
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = var.cognito_domain_name
  user_pool_id = aws_cognito_user_pool.pool.id
}

resource "aws_cognito_user_pool_client" "client" {
  name = var.cognito_client_name
  user_pool_id = aws_cognito_user_pool.pool.id

  callback_urls = var.callback_urls
  logout_urls = var.logout_urls
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = [ "email", "openid", "profile" ]
  supported_identity_providers = [ "Google", "COGNITO" ]
}

resource "aws_cognito_identity_provider" "example_provider" {
  user_pool_id  = aws_cognito_user_pool.pool.id
  provider_name = "Google"
  provider_type = "Google"

  provider_details = {
    authorize_scopes = "profile email openid"
    client_id        = sensitive(var.google_client_id)
    client_secret    = sensitive(var.google_client_secret)
  }

  attribute_mapping = {
    email    = "email"
    username = "sub"
  }
}
