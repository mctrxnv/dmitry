{
  services.throttled.enable = true;

  hardware = {
    intel-gpu-tools.enable = true;

    cpu.intel = {
      sgx.provision.enable = true;
      updateMicrocode = true;
    };
  };
}
