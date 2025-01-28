document.addEventListener('DOMContentLoaded', function () {
  const ktpPopup = document.querySelector('.ktp-popup');
  const paymentPopup = document.querySelector('.payment-popup');
  const ktpImages = document.querySelectorAll('.ktp-image');
  const paymentButtons = document.querySelectorAll('.lihat-bukti-button');
  const closeButtons = document.querySelectorAll('.close-button');
  const searchInput = document.querySelector('.search-input');
  const rows = document.querySelectorAll('.database-table tbody tr');

  let currentCarouselIndex = 1;

  // Open KTP Popup
  ktpImages.forEach(img => {
    img.addEventListener('click', () => {
      ktpPopup.style.display = 'flex';
      document.body.style.overflow = 'hidden';
    });
  });

  // Open Payment Popup
  paymentButtons.forEach(button => {
    button.addEventListener('click', () => {
      paymentPopup.style.display = 'flex';
      document.body.style.overflow = 'hidden';
      updateCarouselImage(currentCarouselIndex);
    });
  });

  // Close Popup
  closeButtons.forEach(button => {
    button.addEventListener('click', () => {
      ktpPopup.style.display = 'none';
      paymentPopup.style.display = 'none';
      document.body.style.overflow = 'auto';
    });
  });

  // Carousel Functionality
  const prevButton = document.querySelector('.carousel-prev');
  const nextButton = document.querySelector('.carousel-next');
  const thumbnails = document.querySelectorAll('.thumbnail');

  prevButton.addEventListener('click', () => {
    if (currentCarouselIndex > 1) {
      currentCarouselIndex--;
      updateCarouselImage(currentCarouselIndex);
    }
  });

  nextButton.addEventListener('click', () => {
    if (currentCarouselIndex < 5) {
      currentCarouselIndex++;
      updateCarouselImage(currentCarouselIndex);
    }
  });

  thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', () => {
      currentCarouselIndex = index + 1;
      updateCarouselImage(currentCarouselIndex);
    });
  });

  function updateCarouselImage(index) {
    const imageContainer = document.querySelector('.carousel-image-container img');
    imageContainer.src = `/images/payment${index}.png`;

    // Highlight active thumbnail
    thumbnails.forEach(thumbnail => thumbnail.classList.remove('active'));
    thumbnails[index - 1].classList.add('active');
  }

  // Search Functionality
  searchInput.addEventListener('input', function () {
    const query = searchInput.value.toLowerCase();
    rows.forEach(row => {
      const member = row.children[0].textContent.toLowerCase();
      const nik = row.children[1].textContent.toLowerCase();
      const whatsapp = row.children[2].textContent.toLowerCase();

      if (
        member.includes(query) ||
        nik.includes(query) ||
        whatsapp.includes(query)
      ) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  });
});
