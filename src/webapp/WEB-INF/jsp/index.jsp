<%@ taglib prefix="c" uri="https://jakarta.ee/taglibs/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Employee Viewer</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
:root{--primary:#0d6efd;--bg:#f7f9fc;--card:#fff}
*{box-sizing:border-box;font-family:system-ui,Arial,sans-serif}
body{margin:0;background:var(--bg);color:#111}
header{display:flex;justify-content:space-between;align-items:center;
       padding:12px 24px;background:var(--primary);color:#fff}
h1{margin:0;font-size:1.25rem}
main{max-width:700px;margin:40px auto;padding:0 24px}
#bar{display:flex;gap:8px;margin-bottom:24px}
input{flex:1;padding:10px;border:1px solid #ccc;border-radius:4px;font-size:1rem}
button{padding:10px 18px;border:none;border-radius:4px;
       background:var(--primary);color:#fff;cursor:pointer}
button:hover{filter:brightness(1.1)}
table{width:100%;border-collapse:collapse;background:var(--card)}
th,td{padding:10px;border-bottom:1px solid #eee;text-align:left}
th{background:#e9ecef}
#status{margin-bottom:8px;font-size:.9rem;color:#555}
</style>
</head>
<body>
<header>
  <h1>Employee Viewer</h1>
  <div>Logged in as <strong><c:out value="${manager}"/></strong></div>
</header>

<main>
  <div id="bar">
    <input id="q" placeholder="Search employee name…" />
    <button onclick="go()">Search</button>
  </div>
  <div id="status">Enter a term or leave blank to list all employees you manage.</div>
  <table id="tbl" hidden>
    <thead><tr><th>ID</th><th>Name</th></tr></thead>
    <tbody></tbody>
  </table>
</main>

<script>
const q=document.getElementById('q'),tbl=document.getElementById('tbl'),
      tbody=tbl.querySelector('tbody'),status=document.getElementById('status');
q.addEventListener('keydown',e=>{if(e.key==='Enter')go();});
function go(){
  status.textContent='Searching…';
  fetch('/api/employees?q='+encodeURIComponent(q.value.trim()))
    .then(r=>r.ok?r.json():Promise.reject(r.statusText))
    .then(list=>{
      tbody.innerHTML='';
      list.forEach(e=>{
        tbody.insertAdjacentHTML('beforeend',`<tr><td>${e.id}</td><td>${e.name}</td></tr>`);
      });
      status.textContent=`${list.length} employee${list.length!==1?'s':''} found.`;
      tbl.hidden=!list.length;
    })
    .catch(err=>{status.textContent='Error: '+err;tbl.hidden=true;});
}
</script>
</body>
</html>