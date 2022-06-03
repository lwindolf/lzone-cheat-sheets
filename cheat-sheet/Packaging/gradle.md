## Configure private repository

For example using user skeleton:

cat <<EOF > /etc/skel/.gradle/init.gradle
allprojects {
    repositories {
        maven {
            url "${MAVEN_REPO_URL}"
            credentials {
                username "${username}"
                password "${password}"
            }
        }
    }
}
EOF
