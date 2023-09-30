encrypt:
    sops -e dot_kube/private_config > dot_kube/private_config.encrypted

decrypt:
    sops -d dot_kube/private_config.encrypted > dot_kube/private_config