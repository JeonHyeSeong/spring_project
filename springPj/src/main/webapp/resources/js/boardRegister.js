console.log("boardRegister.js");

document.getElementById('trigger').addEventListener('click', () => {
     document.getElementById('files').click();
})

// 실행파일, 이미지 파일에 대한 정규표현식 작성
const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024 * 1024 * 20;

function fileValidation(fileName, fileSize) {
     if (!regExpImg.test(fileName)) {
          return 0;
     } else if (regExp.test(fileName)) {
          return 0;
     } else if (fileSize > maxSize) {
          return 0;
     } else {
          return 1;
     }
}

document.addEventListener('change', (e) => {
     if (e.target.id == 'files') {
          document.getElementById('regBtn').disabled = false;
          const fileObj = document.getElementById('files').files;
          console.log(fileObj);
          let div = document.getElementById('fileZone');
          div.innerHTML = "";
          // ul => li로 첨부파일 추가
          // <ul class="list-group list-group-flush">
          // <li class="list-group-item">An item</li>
          let isOk = 1; // 여러 파일이 모두 검증에 통과해야 하기 때문에 *로 각 파일마다 통과여부 확인
          let ul = `<ul class="list-group list-group-flush">`;
          for (let file of fileObj) {
               let validResult = fileValidation(file.name, file.size); // 0 또는 1
               isOk *= validResult;
               ul += `<li class="list-group-item">`;
               ul += `<div class="mb-3">`;
               ul += `${validResult ? '<div class="mb-3">업로드 가능</div>' : '<div class="mb-3 text-danger">업로드 불가능</div>'}`;
               ul += `${file.name}</div>`;
               ul += `<span class="badge rounded-pill text-bg-${validResult ? 'success' : 'danger'}">${file.size}Byte</span></li>`;
          }
          ul += `</ul>`;
          div.innerHTML = ul;

          if (isOk == 0) {
               document.getElementById('regBtn').disabled = true;
          }
     }
})