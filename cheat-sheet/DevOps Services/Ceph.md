## Ceph Cluster CLI

    ceph-volume lvm list

    ceph status
    ceph health
    
    ceph osd lspools
    
## cephadm

    apt install cephadm 
    cephadm add-repo --release pacific
    cephadm install ceph-common
    
    cephadm bootstrap --mon-ip 11.232.9.102
    ceph orch host add <node>
    ceph orch apply mon <nodes>

## ceph-deploy (Legacy)

    ceph-deploy new <nodes>                         # Create new cluster    
    ceph-deploy install --release luminous <nodes>  # Install release

    ceph-deploy mon create-initial                  # Deploy initial monitors
    
    ceph-deploy admin <nodes>                       # Deploy admin nodes
    ceph-deploy mds create <nodes>                  # Deploy metadata nodes
    ceph-deploy mgr create <node>                   # Deploy manager
    ceph mgr module enable dashboard                # Start dashboard on mgr node :7000

    ceph-deploy purge <node>                        # Kill broken nodes
    ceph-deploy purge-data <node>                   # Drop data
 
 
    ceph-deploy osd create --data <device> <node>   # Create object storage
    

## Setup CephFS

    # Create a CephFS pool
    ceph osd pool create cephfs_data 64
    ceph osd pool create cephfs_metadata 64
    ceph fs new cephfs cephfs_metadata cephfs_data
     
    ceph auth get-key client.admin                     # Create client secret
