resource "google_dialogflow_cx_agent" "agent" {
  display_name          = "Greeting Bot"
  location              = var.region
  default_language_code = "en"
  time_zone             = "America/Chicago"
}
