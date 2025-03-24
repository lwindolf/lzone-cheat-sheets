## CLI

    skopeo login --username <username> <registry>

    skopeo inspect docker://myregistry/myimage:tag
    skopeo list-tags docker://myregistry/myimage

    skopeo copy docker://<repo1/image1> docker://<repo2/image2>
    skopeo copy docker://<repo/image:tag> dir:<path>

    skopeo delete <image>

Note: tagging is done using copy
