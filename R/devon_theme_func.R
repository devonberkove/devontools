#' Apply devon_theme
#'
#' `devon_theme()` applies its custom theme to graphs in ggplot2
#'
#' @param plot_type Input string. Optional argument, where if the type of graph
#' is "bar" then the vertical grid lines will be removed.
#' @param remove_legend Input boolean. Optional argument, where if TRUE,
#' the legend will be removed. Should be done most commonly when the axis and
#' fill variables are the same and the axis variable is already labelled.
#'
#' @returns A theme, the custom theme which is applied to the rendered graph.
#'
#' @examples
#' df <- data.frame(
#'   teachers = c(6, 7, 4, 8, 2),
#'   students = c(30, 29, 32, 57, 32),
#'   subjects = c("Math", "Science", "Math", "Math", "Science")
#'   )
#'
#' # Apply base theme to graph
#' ggplot2::ggplot(df, ggplot2::aes(x = teachers, y = students)) +
#'   ggplot2::geom_point() +
#'   devon_theme()
#'
#' # Apply to bar chart to get rid of vertical grid lines
#' ggplot2::ggplot(df, ggplot2::aes(x = teachers)) +
#'   ggplot2::geom_bar() +
#'   devon_theme(plot_type = "bar")
#'
#' # Apply to bar chart to get rid of vertical grid lines and legend
#' ggplot2::ggplot(df, ggplot2::aes(x = subjects, fill = subjects)) +
#'   ggplot2::geom_bar() +
#'   devon_theme(plot_type = "bar", remove_legend = TRUE)
#' @importFrom ggplot2 theme_minimal theme element_text margin element_line
#'   element_rect element_blank
#' @export
devon_theme <- function(plot_type = "default", remove_legend = FALSE) {
  p <- theme_minimal(base_family = "mono") +
    theme(
      plot.title = element_text(
        size = 20,
        face = 'bold',
        color = "#034694",
        margin = margin(b = 8)
      ),
      plot.subtitle = element_text(
        size = 16,
        color = "#034694",
        margin = margin(b = 8)
      ),
      plot.caption = element_text(
        size = 12,
        color = "#034694",
        margin = margin(b = 12),
        hjust = 0
      ),
      axis.text = element_text(size = 10, color = "#034694"),
      axis.title = element_text(size = 12, color = "#034694"),
      panel.grid.major = element_line(
        linewidth = 0.3),
      panel.grid.minor = element_line(
        linewidth = 0.05),
      plot.background = element_rect(
        fill = "#F9FAF6"),
      legend.background = element_rect(
        color = "#034694",
        fill = "#F9FAF6",
        linewidth = 0.5
      ),
      legend.title = element_text(
        size = 14,
        face = "bold",
        color = "#034694"
      ),
      legend.text = element_text(
        color = "#034694"
      )
    )
  if (plot_type == "bar") {
    p <- p +
      theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank()
      )
    }
  if (remove_legend == TRUE) {
    p <- p +
      theme(
        legend.position = "none"
      )
  }
  return(p)
}
