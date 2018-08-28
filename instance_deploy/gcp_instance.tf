resource "google_compute_instance" "default" {
  //インスタンス名、マシンタイプ、作成するゾーンの選択
  name         = "handson-instance"
  machine_type = "f1-micro"
  zone         = "asia-northeast1-a"
  //ネットワークタグを記載
  tags = ["gce-nw"]

  //立ち上げるOSを選択。
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = "10"
    }
  }

  //ネットワークインタフェース情報を記載。
  //IPアドレス固定化等設定
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  //service_accountの設定
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
