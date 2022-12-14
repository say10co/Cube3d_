
NAME =  cub3D

CASTER_SOURCE = src/init_norm.c  src/main.c src/moves.c src/initers.c src/caster_utils.c 

SRC =  src/dda.c src/draw.c src/check.c src/gnl/get_next_line.c src/gnl/get_next_line_utils.c src/map_reader.c src/scene_info.c src/check_map.c src/exit.c src/image.c src/scene_info_utils.c src/scene_info_validators.c src/check_map_utils.c

OBJ = ${SRC:%.c=%.o}
COBJ = ${CASTER_SOURCE:%.c=%.o}

FLAGS = -Wall -Werror -Wextra 
MLX_INC = -I /usr/X11/include

MLX_LINK = -L /usr/X11/lib -lmlx -framework OpenGL -framework  AppKit 
#MLX_LINK = -lmlx -framework OpenGL -framework  AppKit 


COMPILER = gcc 

all: lib $(NAME) 

%.o:%.c
	@$(COMPILER) -c $(FLAGS) $(MLX_INC)  $< -o $@

$(NAME): $(OBJ) $(COBJ)
	@$(COMPILER) $(FLAGS) $(COBJ) $(OBJ)  -L ./libft -lft $(MLX_LINK) -o $@

lib:
	@echo "compiling libft"
	make -C ./libft
	make bonus -C ./libft

clean: libftclean
	@rm -rf $(OBJ) $(COBJ)

libftclean:
	make clean -C ./libft

fclean: libftfclean clean
	rm -rf $(NAME)

libftfclean:
	make fclean -C ./libft

bonus: fclean all

re: fclean all

