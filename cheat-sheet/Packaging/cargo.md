## Configure private crate mirror

For example via user skeleton:

    cat <<EOF > /etc/skel/.cargo/config.toml
    [source]

    [source.crates-io-mirror]
    registry = "$PRIVATE_MIRROR_URL"

    [source.crates-io]
    replace-with = "crates-io-mirror"
    EOF

and provide credentials

    cat <<EOF > /etc/skel/.cargo/credentials.toml
    [registry]
    token = "${MYTOKEN}"
    EOF
