(function () {
    const chartCanvas = document.getElementById('chart-member');
    const ctx = chartCanvas.getContext('2d');
    const dropdown1 = document.getElementById('chart-type-dropdown');
    const dropdown2 = document.getElementById('chart-period-dropdown');
  
  
    // Fungsi untuk memperbarui dropdown kedua
    function updateSecondaryDropdown() {
      dropdown2.innerHTML = '';
      if (dropdown1.value === 'yearly') {
        ['2023', '2024', '2025'].forEach((year) => {
          const option = document.createElement('option');
          option.value = year;
          option.textContent = year;
          dropdown2.appendChild(option);
        });
      } else {
        ['Januari', 'Februari', 'Maret', 'April', 'Mei'].forEach((month) => {
          const option = document.createElement('option');
          option.value = month;
          option.textContent = month;
          dropdown2.appendChild(option);
        });
      }
    }
  
    // Fungsi untuk memperbarui data grafik
    function updateChart() {
      const labels =
        dropdown1.value === 'yearly'
          ? ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
          : Array.from({ length: 31 }, (_, i) => (i + 1).toString());
      const data = Array(labels.length).fill(0).map(() => Math.floor(Math.random() * 1000));
      chartInstance.data.labels = labels;
      chartInstance.data.datasets[0].data = data;
      chartInstance.update();
    }
  
    // Konfigurasi Grafik
    const chartInstance = new Chart(ctx, {
      type: 'line',
      data: {
        labels: [],
        datasets: [
          {
            label: 'Jumlah Member',
            data: [],
            borderColor: '#16A34A',
            backgroundColor: 'rgba(22, 197, 94, 0.2)',
            fill: true,
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false, // Pastikan ini diatur ke false
      },
    });
  
    // Event Listener untuk Dropdown
    dropdown1.addEventListener('change', () => {
      updateSecondaryDropdown();
      updateChart();
    });
  
    dropdown2.addEventListener('change', updateChart);
  
    // Inisialisasi Awal
    updateSecondaryDropdown();
    updateChart();
  })();
  