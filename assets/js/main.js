/* ── Quill Website JavaScript ──────────────────────────────────── */

// ── Navbar scroll effect ──────────────────────────────────────────
window.addEventListener('scroll', () => {
  const nb = document.getElementById('navbar');
  if (nb) nb.classList.toggle('scrolled', window.scrollY > 30);
});

// ── Mobile nav toggle ─────────────────────────────────────────────
const toggle = document.getElementById('navToggle');
const links  = document.getElementById('navLinks');
if (toggle) {
  toggle.addEventListener('click', () => {
    links.classList.toggle('open');
  });
}
// Close on link click
document.querySelectorAll('.nav-links a').forEach(a => {
  a.addEventListener('click', () => links.classList.remove('open'));
});

// ── Tab switching (install) ────────────────────────────────────────
function showTab(id) {
  document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  const content = document.getElementById('tab-' + id);
  if (content) content.classList.add('active');
  document.querySelectorAll('.tab-btn').forEach(b => {
    if (b.getAttribute('onclick')?.includes(id)) b.classList.add('active');
  });
}

// ── Example tab switching ──────────────────────────────────────────
function showExample(id) {
  document.querySelectorAll('.example-panel').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.ex-tab').forEach(b => b.classList.remove('active'));
  const panel = document.getElementById(id);
  if (panel) panel.classList.add('active');
  document.querySelectorAll('.ex-tab').forEach(b => {
    if (b.getAttribute('onclick')?.includes(id)) b.classList.add('active');
  });
}

// ── Mock counter demo ─────────────────────────────────────────────
let mockCount = 0;
function incrementMock() {
  mockCount++;
  const el = document.getElementById('mockCount');
  if (el) el.textContent = 'Count: ' + mockCount;
}

// ── Typewriter hero code ──────────────────────────────────────────
const heroLines = [
  { text: 'let name be "Alice".', type: 'line' },
  { text: 'let age be 25.',        type: 'line' },
  { text: '',                       type: 'line' },
  { text: 'if age is at least 18.', type: 'line' },
  { text: '  say "Welcome, {name}!".', type: 'line' },
  { text: 'else.',                   type: 'line' },
  { text: '  say "Come back later.".', type: 'line' },
  { text: 'end if.',                 type: 'line' },
];

const codeColors = {
  'let':     'color:#79c0ff',
  'be':      'color:#79c0ff',
  'set':     'color:#79c0ff',
  'if':      'color:#ff7b72',
  'else':    'color:#ff7b72',
  'end':     'color:#ff7b72',
  'say':     'color:#79c0ff',
  'return':  'color:#79c0ff',
  'define':  'color:#d2a8ff',
};

function colorizeLine(raw) {
  if (raw.trim() === '') return '';
  // Strings
  let html = raw.replace(/"([^"]*)"/g, '<span style="color:#a5d6ff">"$1"</span>');
  // Keywords at start of line
  const wordMatch = raw.match(/^\s*(\w+)/);
  if (wordMatch) {
    const kw = wordMatch[1].toLowerCase();
    const style = codeColors[kw];
    if (style) {
      html = html.replace(new RegExp('\\b' + wordMatch[1] + '\\b'), `<span style="${style}">${wordMatch[1]}</span>`);
    }
  }
  // Comments
  html = html.replace(/^(\s*note .*)$/, '<span style="color:#8b949e;font-style:italic">$1</span>');
  return html;
}

function typeHeroCode() {
  const el = document.getElementById('heroCode');
  if (!el) return;
  let lineIdx = 0, charIdx = 0, html = '';

  function type() {
    if (lineIdx >= heroLines.length) {
      // restart
      setTimeout(() => {
        html = ''; lineIdx = 0; charIdx = 0;
        el.innerHTML = '';
        setTimeout(type, 800);
      }, 3000);
      return;
    }
    const line = heroLines[lineIdx].text;
    if (charIdx <= line.length) {
      const current = line.substring(0, charIdx);
      const lines = heroLines.slice(0, lineIdx).map(l => colorizeLine(l.text));
      lines.push(colorizeLine(current) + (charIdx < line.length ? '<span style="opacity:.7">|</span>' : ''));
      el.innerHTML = lines.join('\n');
      charIdx++;
      setTimeout(type, charIdx === 0 ? 0 : 28 + Math.random() * 20);
    } else {
      charIdx = 0; lineIdx++;
      setTimeout(type, 80);
    }
  }
  type();
}

// ── Intersection Observer for animations ─────────────────────────
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.style.opacity = '1';
      e.target.style.transform = 'translateY(0)';
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll('.feature-card, .field-card, .doc-card, .download-card').forEach(el => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(24px)';
  el.style.transition = 'opacity .5s ease, transform .5s ease';
  observer.observe(el);
});

// ── Active nav link on scroll ─────────────────────────────────────
const sections = document.querySelectorAll('section[id]');
window.addEventListener('scroll', () => {
  let current = '';
  sections.forEach(s => {
    if (window.scrollY >= s.offsetTop - 100) current = s.id;
  });
  document.querySelectorAll('.nav-links a').forEach(a => {
    a.style.color = a.getAttribute('href') === '#' + current
      ? 'var(--accent)' : '';
  });
});

// ── Init ──────────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  setTimeout(typeHeroCode, 400);
});
