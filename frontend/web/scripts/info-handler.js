document.addEventListener('DOMContentLoaded', function () {
    const page = document.querySelector('.information-page');
    const list = document.querySelector('.information-list');
    const form = document.querySelector('.information-form');
    const popup = document.querySelector('.delete-popup');
    const rows = document.querySelectorAll('.information-table tbody tr');
    const filterButtons = document.querySelectorAll('.filter-button');
    const popupOverlay = document.querySelector('.delete-popup-overlay');
    let selectedId = null;
    
    
  
    // Fungsi untuk mengganti tampilan
    function switchView(view) {
      popupOverlay.style.display = view === 'delete' ? 'flex' : 'none';
      page.dataset.view = view;
      list.style.display = view === 'list' || view === 'delete' ? 'block' : 'none';
      form.style.display = view === 'create' || view === 'edit' ? 'block' : 'none';
      popup.style.display = view === 'delete' ? 'block' : 'none';
    }
  
    // Fungsi untuk menyaring tabel berdasarkan filter
    function filterTable(filter) {
      rows.forEach(row => {
        const type = row.querySelector('.tag').textContent;
        if (filter === 'Semua' || type === filter) {
          row.style.display = '';
        } else {
          row.style.display = 'none';
        }
      });
    }
    
  
    // Tambahkan event listener untuk tombol filter
    filterButtons.forEach(button => {
      button.addEventListener('click', () => {
        const filter = button.textContent;
        
        // Hapus kelas aktif dari semua tombol filter
        filterButtons.forEach(btn => btn.classList.remove('active'));
        
        // Tambahkan kelas aktif ke tombol yang diklik
        button.classList.add('active');
        
        // Terapkan filter pada tabel
        filterTable(filter);
      });
    });
  
    // Event listener untuk tombol tambah
    document.getElementById('add-info-button').addEventListener('click', () => switchView('create'));
  
    // Event listener untuk tombol edit
    document.querySelectorAll('[id^="edit-info-button"]').forEach(button => {
      button.addEventListener('click', () => {
        selectedId = button.id.split('-').pop();
        console.log('Edit ID:', selectedId);
        switchView('edit');
      });
    });
  
    // // Event listener untuk tombol delete
    // document.querySelectorAll('[id^="delete-info-button"]').forEach(button => {
    //   button.addEventListener('click', () => {
    //     selectedId = button.id.split('-').pop();
    //     console.log('Delete ID:', selectedId);
    //     switchView('delete');
    //   });
    // });
  
    // Event listener untuk tombol kirim dan batal pada form
    document.getElementById('submit-info-button').addEventListener('click', () => switchView('list'));
    document.getElementById('cancel-info-button').addEventListener('click', () => switchView('list'));
  
    // Event listener untuk tombol konfirmasi dan batal pada popup
    document.getElementById('confirm-delete-button').addEventListener('click', () => switchView('list'));
    document.getElementById('cancel-delete-button').addEventListener('click', () => switchView('list'));
  });

document.addEventListener('DOMContentLoaded', function () {
  const rows = Array.from(document.querySelectorAll('.information-table tbody tr'));
  const paginationInfo = document.querySelector('.pagination-info');
  const prevButton = document.getElementById('prev-page');
  const nextButton = document.getElementById('next-page');

  let currentPage = 1;
  const rowsPerPage = 8;
  const totalPages = Math.ceil(rows.length / rowsPerPage);

  // Fungsi untuk memperbarui tampilan tabel berdasarkan halaman saat ini
  function updateTable() {
    rows.forEach((row, index) => {
      row.style.display =
        index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage
          ? ''
          : 'none';
    });

    paginationInfo.textContent = `Halaman ${currentPage} dari ${totalPages}`;
    prevButton.style.display = currentPage === 1 ? 'none' : 'inline-block';
    nextButton.style.display = currentPage === totalPages ? 'none' : 'inline-block';
  }

  // Event listener untuk tombol "Next" dan "Previous"
  prevButton.addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      updateTable();
    }
  });

  nextButton.addEventListener('click', () => {
    if (currentPage < totalPages) {
      currentPage++;
      updateTable();
    }
  });

  // Inisialisasi tabel
  updateTable();
});
  