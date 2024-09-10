#provider_aws: string

#parameter: {
    provider: #provider_aws
}

template: {
    components: [
      {
        name: "aws-network-default-template"
        type: "aws-network-default-template"
        properties: {
            providerRef: {
              name: parameter.provider
            }
        }
      }
    ]
}