console.log(bnoVal);

async function CommentPost(cmtData) {
     try {
          const url = "/comment/post";
          const config = {
               method: "post",
               headers: {
                    "content-type": "application/json; charset=utf-8"
               },
               body: JSON.stringify(cmtData)
          };
          const resp = await fetch(url, config);
          const result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}

document.getElementById('cmtPostBtn').addEventListener('click', () => {
     const cmtWriter = document.getElementById('cmtWriter').innerText;
     const cmtText = document.getElementById('cmtText').value;

     if (cmtText == null || cmtText == "") {
          alert('댓글을 입력해주세요!');
          document.getElementById('cmtText').focus();
          return false;
     } else {
          let cmtData = {
               bno: bnoVal,
               writer: cmtWriter,
               content: cmtText
          };
          console.log(cmtData);
          CommentPost(cmtData).then(result => {
               if (result == 1) {
                    alert('댓글 등록 성공!!');
                    document.getElementById('cmtText').value = '';
                    CommentList(bnoVal);
               } else {
                    alert('댓글 등록 실패!!');
               }
          })
     }
})

async function spreadCommentList(bno) {
     try {
          const resp = await fetch("/comment/" + bno);
          const result = await resp.json();
          return result;
     } catch (error) {
          console.log(error);
     }
}

function CommentList(bno) {
     spreadCommentList(bno).then(result => {
          console.log(result);
          let cnt = 0;

          if (result.length > 0) {
               let div = document.getElementById('cmtListArea');
               div.innerHTML = "";
               for (let cvo of result) {
                    cnt++;
                    let str = `<div class="card text-center cmtBox">`;
                    str += `<div class="card-header" data-cno=${cvo.cno}>`;
                    str += `${cvo.writer}</div>`;
                    str += `<div class="card-body">`;
                    str += `<p class="card-text">${cvo.content}</p>`;
                    str += `<input type="text" class="form-control" id="cmtTextMod${cnt}"><br>`;
                    str += `<button type="button" class="btn btn-outline-warning modBtn" data-cnt=${cnt} data-writer=${cvo.writer} data-cno=${cvo.cno}>Mod</button>`;
                    str += `<button type="button" class="btn btn-outline-danger delBtn" data-writer=${cvo.writer} data-cno=${cvo.cno}>Del</button>`;
                    str += `</div>`;
                    str += `<div class="card-footer text-body-secondary">`;
                    str += `<span class="badge rounded-pill text-bg-info">${cvo.modDate}</span>`;
                    str += `</div></div>`;
                    div.innerHTML += str;
               }
          }
     })
}

async function editComment(cmtDataMod) {
     try {
          const url = "/comment/" + cmtDataMod.cno;
          const config = {
               method: "put",
               headers: {
                    "content-type": "application/json; charset=utf-8"
               },
               body: JSON.stringify(cmtDataMod)
          };
          const resp = await fetch(url, config);
          const result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}

async function removeComment(cno, writer) {
     try {
          const url = "/comment/" + cno + "/" + writer;
          const config = {
               method: "delete"
          };
          const resp = await fetch(url, config);
          const result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}

document.addEventListener('click', (e) => {
     if (e.target.classList.contains('modBtn')) {
          let cnt = e.target.dataset.cnt;
          let cmtDataMod = {
               cno: e.target.dataset.cno,
               content: document.getElementById(`cmtTextMod${cnt}`).value,
               writer: e.target.dataset.writer
          };
          console.log(cmtDataMod);
          editComment(cmtDataMod).then(result => {
               if (result == 1) {
                    alert('댓글 수정 성공!!');
                    CommentList(bnoVal);
               } else {
                    alert('댓글 수정 실패!!');
               }
          })
     } else if (e.target.classList.contains('delBtn')) {
          let cnoVal = e.target.dataset.cno;
          let writer = e.target.dataset.writer;
          console.log(cnoVal);
          console.log(writer);
          removeComment(cnoVal, writer).then(result => {
               if (result == 1) {
                    alert('댓글 삭제 성공!!');
                    location.reload();
               } else {
                    alert('댓글 삭제 실패!!');
               }
               CommentList(bnoVal);
          })
     }
})