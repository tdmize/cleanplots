# Derivation of cleanplots hex codes from the Stata scheme definitions.
# Not part of the installed package.
#
# Stata's color intensity adjustment (verified against colorpalette output):
#   multiplier m < 1 (lighten): round(RGB * m + 255 * (1 - m))
#   multiplier m > 1 (darken):  round(RGB / m)
# Stata rounds .5 up (round-half-up), unlike R's round().

r_half_up <- function(x) floor(x + 0.5)
lighten <- function(C, m) r_half_up(C * m + 255 * (1 - m))
darken  <- function(C, m) r_half_up(C / m)
mod <- function(C, m) if (m == 1) C else if (m < 1) lighten(C, m) else darken(C, m)
hex <- function(C) sprintf("#%02X%02X%02X", C[1], C[2], C[3])

# Stata base named colors (verified from
# `colorpalette ..., intensify(.7)` output on Stata 18)
bases <- list(
  red = c(255, 0, 0), eltblue = c(130, 192, 233), black = c(0, 0, 0),
  purple = c(128, 0, 128), pink = c(255, 0, 128), navy = c(26, 71, 111),
  lavender = c(146, 141, 211),
  gs4 = c(64, 64, 64), gs6 = c(96, 96, 96), gs7 = c(112, 112, 112),
  gs9 = c(144, 144, 144), gs12 = c(192, 192, 192)
)

# Main palette (scheme: color p1-p10)
mains <- list(
  c("red", 1.2), c("eltblue", .9), c("black", 1), c("gs9", 1),
  c("purple", 1.1), c("pink", .3), c("navy", 1.3), c("gs12", 1),
  c("gs4", 1), c("lavender", .35)
)
cat("Main palette:\n")
for (m in mains) {
  v <- mod(bases[[m[1]]], as.numeric(m[2]))
  cat(sprintf("  %-14s %s\n", paste0(m[1], "*", m[2]), hex(v)))
}

# Bar palette (scheme: color p1bar-p10bar), rendered with the scheme's
# `intensity bar 70`: the bar color is resolved first, then faded 30%
# toward white at draw time.
bars <- list(
  c("red", 1), c("eltblue", .7), c("black", .9), c("gs9", 1),
  c("purple", .9), c("pink", .2), c("navy", 1.1), c("gs12", 1),
  c("gs6", 1), c("lavender", .3)
)
cat("Bar palette (as rendered at intensity 70):\n")
for (b in bars) {
  raw  <- mod(bases[[b[1]]], as.numeric(b[2]))
  fill <- lighten(raw, 0.7)
  cat(sprintf("  %-14s pXbar: %s  rendered: %s\n",
              paste0(b[1], "*", b[2]), hex(raw), hex(fill)))
}
