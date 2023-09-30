encrypt:
    sops -e dot_kube/private_config > dot_kube/private_config.encrypted
    sops -e private_dot_ssh/private_kaidobit_ed25519 > private_dot_ssh/private_kaidobit_ed25519.encrypted
    sops -e private_dot_ssh/private_mayflower_ed25519 > private_dot_ssh/private_mayflower_ed25519.encrypted

decrypt:
    sops -d dot_kube/private_config.encrypted > dot_kube/private_config
    sops -d private_dot_ssh/private_kaidobit_ed25519.encrypted > private_dot_ssh/private_kaidobit_ed25519
    sops -d private_dot_ssh/private_mayflower_ed25519.encrypted > private_dot_ssh/private_mayflower_ed25519