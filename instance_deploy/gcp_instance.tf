resource "google_compute_instance" "handson" {
  //インスタンス名、マシンタイプ、作成するゾーンの選択
  name         = "handson-instance"
  machine_type = "f1-micro"
  zone         = "asia-northeast1-a"
  //ネットワークタグを記載
  tags = ["http-server"]

  //立ち上げるOSを選択。
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = "10"
    }
  }

  //プリミティブVMとして作成
  scheduling {
    preemptible = true
    automatic_restart = false
  }

  //ネットワークインタフェース情報を記載。
  //IPアドレス固定化等設定
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    "block-project-ssh-keys" = "true"
    "sshKeys" = "${var.test_ssh_keys}"
  }

  //service_accountの設定
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
