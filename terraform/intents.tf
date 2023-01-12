resource "null_resource" "default_welcome_intent" {
  provisioner "local-exec" {
    command = <<-EOT
    curl --location --request PATCH "https://$LOCATION-dialogflow.googleapis.com/v3/projects/$PROJECT/locations/$LOCATION/agents/$AGENT/intents/$DEFAULT_WELCOME_INTENT?updateMask=trainingPhrases" \
        -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
        -H 'Content-Type: application/json' \
        --data-raw "
        {
          'trainingPhrases': [
            {'parts': [{'text': 'hi how are you'}], 'repeatCount': 1},
            {'parts': [{'text': 'greetings'}], 'repeatCount': 1},
            {'parts': [{'text': 'howdy'}], 'repeatCount': 1},
            {'parts': [{'text': 'hello'}], 'repeatCount': 1},
            {'parts': [{'text': 'hello there'}], 'repeatCount': 1},
            {'parts': [{'text': 'hi'}], 'repeatCount': 1},
            {'parts': [{'text': 'nice to meet you'}], 'repeatCount': 1},
            {'parts': [{'text': 'whats up'}], 'repeatCount': 1},
            {'parts': [{'text': 'hows it going'}], 'repeatCount': 1},
            {'parts': [{'text': 'hey'}], 'repeatCount': 1}
          ]
        }
        "
   EOT

    environment = {
      PROJECT                = var.project_id
      LOCATION               = var.region
      AGENT                  = google_dialogflow_cx_agent.agent.name
      DEFAULT_WELCOME_INTENT = "00000000-0000-0000-0000-000000000000"
    }
  }

  depends_on = [
    google_dialogflow_cx_agent.agent
  ]
}
